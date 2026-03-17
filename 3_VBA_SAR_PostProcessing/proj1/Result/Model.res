MWS Result File Version 20150206
size=i:26

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
files=s:simulation_overview.json

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:RefSpectrum_pw.sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:e-field (f=2.4)_pw.m3d

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAMeshDetails.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAConnectivity.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAMeshFeedback.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:World.fid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:model.gex

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.sid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.fmm

type=s:FOLDER
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results

type=s:XYSIGNAL
subtype=s:user
problemclass=s::4:3
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default_lf.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::0:0
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default.sig

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\PBA
files=s:PBAMeshFeedback.rex

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\Connectivity
files=s:PBAConnectivity.rex

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\PBADetails
files=s:PBAMeshDetails.rex

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\Plane wave
files=s:plw.sig

type=s:EFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\E-Field\e-field (f=2.4) [pw]
files=s:e-field (f=2.4)_pw.m3d
files=s:e-field (f=2.4)_pw_m3d.rex

type=s:XYSIGNAL
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Energy\Energy [pw]
files=s:pw.eng

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [pw]\Loss per Material\Volume loss in Water (distilled)
files=s:cVolume_loss_in_Water (distilled)(pw).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [pw]\Loss in Dielectrics
files=s:cTotal_loss_in_dielectrics(pw).sig

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:TABLE
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
treepath=s:Tables\0D Results\ASCII Export
files=s:ASCII Export.rd0
files=s:ASCII Export.rd0

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Water (distilled)\Dispersive\Eps'
files=s:Water (distilled)_eps_re.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Water (distilled)\Dispersive\Eps''
files=s:Water (distilled)_eps_im.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Water (distilled)\Dispersive\Eps TangD
files=s:Water (distilled)_eps_tgd.sig

