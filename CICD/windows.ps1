$Password = ConvertTo-SecureString -String 'Travis' -AsPlainText -Force

Import-PfxCertificate -FilePath CICD\certificate.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password

& "C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe" sign -v -debug -fd sha256 -sm -s My -n `"charlie890414`" -d `"Desc`" Sorting.Algorithm.Visualizor.exe