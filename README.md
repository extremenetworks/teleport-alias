# teleport-alias
We'll add alias access each of kubernetes clusters

## Usage

1. **Set Up the `tkl` Alias**:
   Add the following to your `~/.zshrc` (or `~/.bashrc` for `bash`):
   ```bash
   alias tkl='source <(curl -s https://github.com/extremenetworks/teleport-alias/main/alias_loader.sh)'
   ```

2. **Run the Command**:
   Use the `tkl` alias to load aliases and log into a cluster:
   ```bash
   tkl remote
   ```

3. **Validate Aliases**:
   Once the script completes, aliases will be available in your shell. For example:
   ```bash
   ka get po
   ```
