import open3d as o3d
import trimesh
import numpy as np


def decimate_for_cst(input_path, output_path, target_triangles):
    print(f"Loading high-res mesh from: {input_path}")

    # 1. Load with Open3D for the math
    mesh = o3d.io.read_triangle_mesh(input_path)
    print(f"Original mesh has {len(mesh.triangles)} triangles.")

    # 2. Decimate the mesh
    print(f"Decimating down to {target_triangles} triangles for CST Studio...")
    decimated_mesh = mesh.simplify_quadric_decimation(
        target_number_of_triangles=target_triangles)

    # --- THE FIX: Pass the data to Trimesh to write a perfect STL ---
    print("Formatting for Windows/VS Code 3D viewers...")
    verts = np.asarray(decimated_mesh.vertices)
    faces = np.asarray(decimated_mesh.triangles)

    # Create a Trimesh object and export it (just like Project 1)
    clean_mesh = trimesh.Trimesh(vertices=verts, faces=faces)
    clean_mesh.export(output_path)

    print(f"Success! Saved perfectly formatted mesh as: {output_path}")


if __name__ == "__main__":
    # Point this to your high-res head
    INPUT_MESH = "../1_MRI_to_CAD_Mesh/virtual_twin_brain_sub-07.stl"

    # Output file
    OUTPUT_MESH = "cst_ready_head.stl"

    TARGET_FACES = 100000

    decimate_for_cst(INPUT_MESH, OUTPUT_MESH, TARGET_FACES)
