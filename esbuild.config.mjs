import * as esbuild from "esbuild";
import { exec } from "child_process";

const isServe = process.argv.includes("--serve");

// Function to pack the ZIP file
function packZip() {
  exec("node ./pack-zip.js", (err, stdout, stderr) => {
    if (err) {
      console.error("Error packing zip:", err);
      if (stderr) console.error(stderr);
      return;
    }
    console.log(stdout.trim());
  });
}

// Custom plugin to pack ZIP after build or rebuild
const zipPlugin = {
  name: "zip-plugin",
  setup(build) {
    build.onEnd((result) => {
      if (result.errors.length > 0) {
        console.error("Build failed with errors, skipping zip packaging");
        return;
      }
      packZip();
    });
  },
};

// Base build configuration
let buildConfig = {
  entryPoints: ["src/main.js"],
  bundle: true,
  minify: true,
  logLevel: "info",
  color: true,
  outdir: "dist",
  plugins: [zipPlugin],
};

// Main function to handle both serve and production builds
(async function () {
  try {
    if (isServe) {
      console.log("Starting development server...");

      // Watch and Serve Mode
      const ctx = await esbuild.context(buildConfig);

      await ctx.watch();
      const { host, port } = await ctx.serve({
        servedir: ".",
        port: 3000,
      });

      console.log(`Server running at http://${host}:${port}`);
    } else {
      console.log("Building for production...");
      await esbuild.build(buildConfig);
      console.log("Production build complete.");
    }
  } catch (error) {
    console.error("Build failed:", error);
    process.exit(1);
  }uu
})();
