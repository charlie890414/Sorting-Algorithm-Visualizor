$Password = ConvertTo-SecureString -String 'Travis' -AsPlainText -Force

Import-PfxCertificate -FilePath my-certificate.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password

Start-Process -PassThru -Wait "C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe" -ArgumentList "sign -v -debug -t http://timestamp.comodoca.com/authenticode -sm -s My -n `"charlie890414`" -d `"Desc`" Sorting.Algorithm.Visualizor.exe"