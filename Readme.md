# BioEM Virtual Twin & Compliance Pipeline

An end-to-end pipeline that takes a raw MRI scan, converts it into a simulation-ready 3D digital twin, runs a 2.4 GHz electromagnetic exposure simulation, and automatically generates a safety compliance report — all with minimal manual steps.

---

## Motivation

Testing electromagnetic (EM) exposure on biological tissue (e.g. Wi-Fi radiation safety) normally requires either expensive physical phantoms or a fragmented, manual CAD workflow. This project automates the full chain from medical imaging data to a pass/fail compliance result using open-source Python tools and CST Studio Suite.

---

## Pipeline Overview

```
NIfTI MRI Scan (.nii.gz)
        │
        ▼
Step 1 — MRI to 3D Mesh  (1_MRI_to_CAD_Mesh/mri_to_mesh.py)
  • nibabel: load scan voxel data
  • Gaussian smoothing (σ=1.0)
  • Tissue threshold segmentation
  • Morphological closing (iterations=3) → seal mouth/eye cavities
  • Marching Cubes surface reconstruction
  • trimesh: extract largest watertight component, remove floating artifacts
  Output: virtual_twin_brain_sub-07.stl  (~1M triangles)
        │
        ▼
Step 2 — Mesh Optimisation  (2_CST_Simulation_Prep/decimate_mesh.py)
  • Open3D Quadric Decimation: 1M → ~100k triangles (>90% reduction)
  • Preserve anatomical geometry for EM solver import
  Output: cst_ready_head.stl
        │
        ▼
Step 3 — CST EM Simulation  (3_VBA_SAR_PostProcessing/)
  • Import decimated STL into CST Studio Suite
  • Scale phantom to 30mm biological sample
  • Tune Global Mesh Properties (lines/wavelength = 3) → ~22k cells
    (fits within the 100k-cell CST Learning Edition limit)
  • Plane Wave excitation at 2.4 GHz (Wi-Fi standard)
  • Solve: E-field distribution + power loss per material
        │
        ▼
Step 4 — Automated Compliance  (VBA + Python)
  • VBA macro (cst_automation.bas): automates power loss data export from CST tree
  • Python (compliance_report.py): parses exported ASCII data,
    checks against IEC safety threshold (5.0e-07 W)
  Output: PASS / FAIL report
```

---

## Results

| Metric | Value |
|---|---|
| Frequency | 2.4 GHz |
| Peak E-field | 204.2 V/m |
| Absorbed Power | 3.41e-07 W |
| Safety Threshold | 5.0e-07 W |
| **Status** | **PASSED** |

---

## Repository Structure

```
BioEM-Virtual-Twin-Pipeline/
│
├── 1_MRI_to_CAD_Mesh/
│   ├── mri_to_mesh.py          # NIfTI → STL pipeline
│   ├── sub-01_T1w.nii.gz       # sample MRI scan
│   ├── sub-07_T1w.nii.gz       # sample MRI scan
│   ├── virtual_twin_brain_sub-07.stl  # generated mesh
│   └── image.png               # reconstruction screenshot
│
├── 2_CST_Simulation_Prep/
│   ├── decimate_mesh.py        # Open3D mesh decimation
│   ├── cst_ready_head.stl      # decimated, simulation-ready mesh
│   └── mesh_view.png           # decimated mesh screenshot
│
└── 3_VBA_SAR_PostProcessing/
    ├── cst_automation.bas      # VBA macro: export power loss from CST tree
    ├── compliance_report.py    # Python: parse + threshold check
    ├── power_loss_data.txt     # exported CST simulation output
    ├── efield_results.txt      # E-field results
    ├── sim_results.png         # CST simulation screenshot
    └── proj1/                  # CST project files
```

---

## Setup

### Python dependencies

```bash
pip install nibabel numpy scikit-image trimesh scipy open3d
```

### Step 1 — Generate mesh from MRI

```bash
python 1_MRI_to_CAD_Mesh/mri_to_mesh.py
```

Edit `INPUT_MRI` and `OUTPUT_MESH` paths inside the script. Adjust `TISSUE_THRESHOLD` (default: 80) based on your scan's intensity range.

### Step 2 — Decimate for simulation

```bash
python 2_CST_Simulation_Prep/decimate_mesh.py
```

### Step 3 — CST Simulation

1. Open CST Studio Suite and import `cst_ready_head.stl`
2. Set up a Plane Wave source at 2.4 GHz
3. Tune mesh settings to stay within solver constraints
4. Run the simulation

### Step 4 — Run compliance report

In CST, run `cst_automation.bas` to export `power_loss_data.txt`, then:

```bash
python 3_VBA_SAR_PostProcessing/compliance_report.py
```

---

## Key Engineering Decisions

| Challenge | Solution |
|---|---|
| Raw mesh had 1M+ triangles — too heavy for CST solver | Open3D Quadric Decimation to ~100k while preserving shape |
| Mesh had gaps at mouth and eye cavities | Morphological closing (scipy, iterations=3) before Marching Cubes |
| CST Learning Edition: 100k mesh cell hard limit | Scaled phantom to 30mm, reduced lines/wavelength to 3 → ~22k cells |
| Manual CST data export was error-prone | VBA macro automates tree selection and ASCII export |

---

## References

- ICNIRP Guidelines on EMF exposure: [https://www.icnirp.org/](https://www.icnirp.org/)
- CST Studio Suite: [https://www.3ds.com/products/simulia/cst-studio-suite](https://www.3ds.com/products/simulia/cst-studio-suite)
- Open3D Documentation: [http://www.open3d.org/docs/](http://www.open3d.org/docs/)
- nibabel Documentation: [https://nipy.org/nibabel/](https://nipy.org/nibabel/)
- scikit-image Marching Cubes: [https://scikit-image.org/docs/stable/api/skimage.measure.html](https://scikit-image.org/docs/stable/api/skimage.measure.html)

---

## License

[MIT License](LICENSE)
