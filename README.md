# teleport-alias
We'll add alias access each of kubernetes clusters

## Usage

1. **Set Up the `tkl` Alias**:
   Add the following to your `~/.zshrc` (or `~/.bashrc` for `bash`):
   select file:alias_loader.sh and then click Raw button on top right, copy your token=xxxx into this env.
   ```bash
   alias tkl='git -C ~/.my_private_alias_repo pull >/dev/null 2>&1 || git clone git@github.com:extremenetworks/teleport-alias.git ~/.my_private_alias_repo; source ~/.my_private_alias_repo/alias_loader.sh'
   ```

2. **Run the Command**:
   Use the `tkl` alias to load aliases and login to the cluster:
   ```bash
   tkl eu0-gdc
   tkl stage-rdc
   ```

3. **Validate Aliases**:
   Once the script completes, aliases will be available in your shell. For example:
   ```bash
   alias
   tsh status
   tsh kube ls
   
   k get pod
   ```
