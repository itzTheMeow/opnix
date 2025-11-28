{ pkgs }:
pkgs.buildGoModule {
  pname = "opnix";
  version = "0.7.0";
  src = import ./source.nix { inherit pkgs; };
  vendorHash = "sha256-O0ItIRhLBP41bwsObHxU6zVjSphxyWwOdyKip5AzSlw=";
  subPackages = [ "cmd/opnix" ];

  nativeBuildInputs = [ pkgs.makeWrapper pkgs.autoPatchelfHook ];

  buildInputs = [
    pkgs.stdenv.cc.cc.lib
    pkgs.systemd
  ];

  postInstall = ''
    mkdir -p $out/lib
    cp $src/libop_sdk_ipc_client.so $out/lib/
    wrapProgram $out/bin/opnix \
      --set OP_SHARED_LIB_PATH $out/lib/libop_sdk_ipc_client.so
  '';
}
