# Automatic Updates

If you are using Prism Launcher, you can setup automatic updates for Velvet by following these steps:

1. Download the latest `packwiz-installer-bootstrap.jar` from the [Packwiz GitHub releases](https://github.com/comp500/packwiz-installer-bootstrap/releases).

2. Open Prism Launcher and right click on the Velvet modpack, selecting **Folder**. This will open the modpack folder.

3. Place the `packwiz-installer-bootstrap.jar` in the `.minecraft` folder of the modpack.

4. Right click on the Velvet modpack again and select **Edit**.

5. In the **Settings** tab, under **Custom Commands**, add the following as a pre-launch command:
   ```sh
   "$INST_JAVA" -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/ChecksumDev/velvet/stable/pack.toml
   ```

Save the settings and launch the modpack. The modpack will now automatically check for updates and download them when available.
