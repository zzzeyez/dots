import { FileSystemWatcher } from 'coc.nvim';
/**
 * Create a file watcher. Clears prettier's configuration cache on
 * file change, create, delete.
 * @returns disposable file system watcher.
 */
declare function fileListener(): FileSystemWatcher;
export default fileListener;
