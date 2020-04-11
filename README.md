# AVW_settings - get runtime settings for xojo
### Where to find the latest version of this file:
[https://github.com/avwohl/xojo_AVW_settings/blob/master/README.md](https://github.com/avwohl/xojo_AVW_settings/blob/master/README.md)

### Documentation using git and submodules and these libs in xojo:
[https://github.com/avwohl/xojo_documentation](https://github.com/avwohl/xojo_documentation)

### Download this git submodule for settings for xojo:
[https://github.com/avwohl/xojo_AVW_settings](https://github.com/avwohl/xojo_AVW_settings)

## Sample usage
### In the app declarations
`Var settings as AVW_settings`\
Or create a property of type AVW_settings in the application or some other suitable object.

### In the app constructor:
```
settings=New AVW_sttings
settings.define("connect_to_host")
settings.define("connect_to_port")
settings.define("connect_timeout_secs")
settings.read_file("my_config.cfg")
// check if any settings are missing from the config
// this is optional, if you leave off the check it won't
// fail until the app tries to fetch a setting that was not set
// using check as it fail at startup time rather than much later
settings.check()
```

### Sample config file my_config.cfg:
```
# a sample comment
connect_to_host:foo.com
include:common.cfg
```

### Sample include sub config file common.cfg:
```
# sample included config file included from some other config
connect_to_port:25
connect_time_out_secs:20
```

### Optionally, a defined setting can have a default
`settings.define_default("connect_to_port",25)`

### In your program fetch an integer setting:
`Var some_int as integer=app.settings.get_integer("connect_to_port")`

### In your program fetch a string setting:

var some_string as string=app.settings.get_string("connect_to_host")`

### Errors detected at runtime
The following errors are detected at runtime:
```
A setting defined in the program is missing from the config file.
A setting in a config file is not defined in the program
An IO error occurred reading a config file, no such file for example
At runtime the program asked for a setting that was not set or defined
```

### Error handling
Errors will throw a subclass of RuntimeError. See the sources for classes with names beginning AVW_settings_error*.  Most of the errors are thrown at startup (see the errors above). In a typical console application the usual catchall of catching RuntimeError and printing the mesg field will usually do the job.

