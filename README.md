# Yazi Integration For Micro
## Warning
This is a simple yazi integration for micro, it has barely any error handling or failsafes or any kind and it __will fail__. Please report any bugs and stuff. Also, any help is welcome.
## Docs
It provides the commands `yazi` and `y` to open yazi from within micro. The default behavior can be set in `settings.json` of your micro config like such:
```json
{
    "yazi.mode": "tab"
}
```
You can choose between the options `"tab"`(default), `"hsplit"`, `"vsplit"`, and `"inplace"`. You can also pass any of these as an argument for the `yazi` command to override the default behavior, for example, passing the command:
```
> yazi hsplit
```
Will override any behavior set in `settings.json`.

You also can add this keybind to your `bindings.json` to open yazi with the default behavior:
```json
{
    "Ctrl-y": "command:yazi"
}
```
