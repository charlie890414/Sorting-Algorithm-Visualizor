$Password = ConvertTo-SecureString -String 'Travis' -AsPlainText -Force
Import-PfxCertificate -FilePath certificate.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password
& "C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe" sign -a -fd SHA256 -t http://timestamp.comodoca.com/authenticode -f certificate.pfx Sorting.Algorithm.Visualizor.exe -p $Password