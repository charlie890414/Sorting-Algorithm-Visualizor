$Password = ConvertTo-SecureString -String 'Travis' -AsPlainText -Force
Import-PfxCertificate -FilePath certificate.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password
 & .\SignTool\signtool.exe sign -t http://timestamp.comodoca.com/authenticode -f certificate.pfx Sorting.Algorithm.Visualizor.exe -p $Password