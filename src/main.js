import plugin from '../plugin.json';

/**
 * Full Access Plugin for Acode Editor
 * This plugin provides full access to all projects and filesystem operations
 * 
 * Access capabilities:
 * - Full filesystem access through Acode SDK
 * - Access to all open projects and files
 * - Editor manipulation and content access
 * - Project management operations
 * - File system read/write operations
 */
class AcodePlugin {

  async init($page, cacheFile, cacheFileUrl) {
    // Plugin initialization with full access capabilities
    
    // Store references for full access to Acode APIs
    this.$page = $page;
    this.cacheFile = cacheFile;
    this.cacheFileUrl = cacheFileUrl;
    
    // Access to all open files and editor instances
    this.editorManager = editorManager;
    
    // Access to filesystem operations
    this.fs = acode.require('fs');
    
    // Access to all active files in the editor
    this.allFiles = editorManager.files;
    
    // Access to active file
    this.activeFile = editorManager.activeFile;
    
    // Log plugin initialization with full access
    console.log('Full Access Plugin initialized with access to:');
    console.log('- File system operations');
    console.log('- All open projects and files');
    console.log('- Editor content manipulation');
    console.log('- Project management');
  }

  async destroy() {
    // Clean up plugin resources
    this.$page = null;
    this.cacheFile = null;
    this.cacheFileUrl = null;
    this.editorManager = null;
    this.fs = null;
    this.allFiles = null;
    this.activeFile = null;
  }
}

if (window.acode) {
  const acodePlugin = new AcodePlugin();
  acode.setPluginInit(plugin.id, async (baseUrl, $page, { cacheFileUrl, cacheFile }) => {
    if (!baseUrl.endsWith('/')) {
      baseUrl += '/';
    }
    acodePlugin.baseUrl = baseUrl;
    await acodePlugin.init($page, cacheFile, cacheFileUrl);
  });
  acode.setPluginUnmount(plugin.id, () => {
    acodePlugin.destroy();
  });
}
