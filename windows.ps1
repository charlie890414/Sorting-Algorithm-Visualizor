$Password = ConvertTo-SecureString -String 'Travis' -AsPlainText -Force
Import-PfxCertificate -FilePath certificate.pfx -CertStoreLocation Cert:\LocalMachine\My -Password $Password