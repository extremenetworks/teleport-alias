# teleport-alias
The alias are for easy use `kubectl -n namespace xxx` to access kubernetes clusters

First you need add alias into Git repo for each of kubernetes cluster.
The alias *.sh name convention as: load_alias_{cluster_name}-{gdc/rdc}.sh 


## Usage

*Linux & macOS Setup*
1. **Set Up the `tkl`` function Alias**:
   Add the following line to your ~/.zshrc (for zsh) or ~/.bashrc (for bash). If using ~/.bash_profile, add it there instead.
   ```bash
   tkl() {
     # Unset any existing Teleport session context so you can switch clusters
     eval $(tsh env --unset)
     
     # Update your alias repository, cloning if necessary
     git -C ~/.my_private_alias_repo pull >/dev/null 2>&1 || \
       git clone git@github.com:extremenetworks/teleport-alias.git ~/.my_private_alias_repo
     
     # Load the appropriate alias loader with any passed arguments
     source ~/.my_private_alias_repo/alias_loader.sh "$@"
   }
   
   ```
2. **Apply the Changes**:
   Run:
   ```bash
   source ~/.zshrc  # For zsh
   source ~/.bashrc  # For bash
   ```

3. **Use the `tkl`` Alias**:
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

*Windows Setup*
Windows users can use Git Bash, PowerShell, or Windows Subsystem for Linux (WSL).
**Using Git Bash**
1. Open Git Bash. Edit ~/.bashrc (or ~/.bash_profile) using:
   ```bash
   nano ~/.bashrc
   ```
2. **Add the function of alias**
   ```bash
   tkl() {
     # Unset any existing Teleport session context so you can switch clusters
     eval $(tsh env --unset)
     
     # Update your alias repository, cloning if necessary
     git -C ~/.my_private_alias_repo pull >/dev/null 2>&1 || \
       git clone git@github.com:extremenetworks/teleport-alias.git ~/.my_private_alias_repo
     
     # Load the appropriate alias loader with any passed arguments
     source ~/.my_private_alias_repo/alias_loader.sh "$@"
   }
   ```
3. **Apply changes**
   ```bash
   source ~/.bashrc
   ```
4. **User `tkl`**
   ```bash
   tkl eu0-gdc
   tkl stage-rdc
   ```
5. **Validate Aliases**:
   Once the script completes, aliases will be available in your shell. For example:
   ```bash
   alias
   tsh status
   tsh kube ls
   k get pod
   ```
