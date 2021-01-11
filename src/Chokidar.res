@bs.deriving(abstract)
type await_write_finish = {
  stabilityThreshold: int,
  pollInterval: int,
}

@bs.deriving(abstract)
type options = {
  ignored: string,
  @bs.optional
  ignoreInitial: bool,
  @bs.optional
  followSymlinks: bool,
  @bs.optional
  cwd: string,
  @bs.optional
  disableGlobbing: bool,
  @bs.optional
  usePolling: bool,
  @bs.optional
  interval: int,
  @bs.optional
  binaryInterval: int,
  @bs.optional
  alwaysStat: bool,
  @bs.optional
  depth: int,
  @bs.optional
  awaitWriteFinish: await_write_finish,
  @bs.optional
  ignorePermissionErrors: bool,
  @bs.optional
  atomic: bool,
  @bs.optional
  persistent: bool,
}

type tFSWatcher
@bs.module("chokidar") external watch: (string, ~options: options=?, unit) => tFSWatcher = "watch"
@bs.send external on: (tFSWatcher, string, string => unit) => string = "on"
@bs.send external close: (tFSWatcher, unit) => unit = "close"

// usage:
// let watcher = Chokidar.watch(".", ());
// let doit = (s:string) => Js.log(s);
// Chokidar.on(watcher, "change", doit);
// Chokidar.close(watcher, ());
