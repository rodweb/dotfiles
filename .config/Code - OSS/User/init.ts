import * as vscode from "vscode";

export function init(context: vscode.ExtensionContext) {
    vscode.window.showInformationMessage('Initialized');
    const config = vscode.workspace.getConfiguration();
    config.update("workbench.editor.showTabs", false, vscode.ConfigurationTarget.Global);
    config.update("editor.minimap.enabled", false, vscode.ConfigurationTarget.Global);
}
