$Pfxpath = './certificate.pfx'
$Password = ConvertTo-SecureString -String 'Travis' -AsPlainText -Force
Import-PfxCertificate -FilePath $Pfxpath -CertStoreLocation Cert:\CurrentUser\My -Password $Password
