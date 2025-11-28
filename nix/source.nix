{ pkgs }:
pkgs.lib.cleanSourceWith {
  src = ../.;
  filter =
    path: type:
    baseNameOf path == "libop_sdk_ipc_client.so"
    || (
      pkgs.lib.cleanSourceFilter path type
      && (
        builtins.match ".*\\.go$" path != null
        || builtins.match ".*go\\.(mod|sum)$" path != null
        || builtins.match ".*/cmd(/.*)?$" path != null
        || builtins.match ".*/internal(/.*)?$" path != null
      )
    );
}
