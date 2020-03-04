import { Disposable } from 'vscode-languageserver-protocol';
/**
 * Create an ignore file handler. Will lazily read ignore files on a per-resource
 * basis, and cache the contents until it changes.
 */
declare function ignoreFileHandler(disposables: Disposable[]): any;
export default ignoreFileHandler;
