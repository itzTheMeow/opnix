{pkgs}:
pkgs.buildGoModule {
  pname = "opnix";
  version = "0.7.0";
  src = ../.;
  vendorHash = "sha256-Wd5oHFhDiWY8kjSW4iRN840PlYJ5lHlWb9gM1+Q9F90=";
  subPackages = ["cmd/opnix"];
}
