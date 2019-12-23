$Password = ConvertTo-SecureString -String $Env:CERT_PASSWORD -AsPlainText -Force

Import-PfxCertificate -FilePath certificate.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password

Start-Process -PassThru -Wait "C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool.exe" -ArgumentList "sign -t http://timestamp.comodoca.com/authenticode -f certificate.pfx Sorting.Algorithm.Visualizor.exe"