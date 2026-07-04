let
  klownie = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcXKv3/wMaJS35Vezls0oUuNOosMj7qvR+4cUMmnPce";
  users = [ klownie ];

  zimablade = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcXKv3/wMaJS35Vezls0oUuNOosMj7qvR+4cUMmnPce";
  wsl = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcXKv3/wMaJS35Vezls0oUuNOosMj7qvR+4cUMmnPce";
  contabo-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDcXKv3/wMaJS35Vezls0oUuNOosMj7qvR+4cUMmnPce";
  systems = [ zimablade wsl contabo-server ];
in
{
  "nextcloud-admin-password.age".publicKeys = [ zimablade ];
  "cloudflare-creds.age".publicKeys = [ zimablade ];
  "rathole-client.age".publicKeys = [ zimablade ];
}
