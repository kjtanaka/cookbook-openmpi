openmpi Cookbook
================
This cookbook installs openmpi from source.

Requirements
------------

#### cookbook

- `build-essential`

Attributes
----------

#### openmpi::default
- `['openmpi']['version']` - OpenMPI version. Default is `1.8.1`.
- `['openmpi']['download_url']` - Download URL. Default is `http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.1.tar.bz2`.
- `['openmpi']['download_dir']` - Download directory. Default is `/root/source`.
- `['openmpi']['install_dir']` - Install directory. Default is `/opt`.
- `['openmpi']['support_torque']` - If Torque is supported or not. Default is `false`.
- `['openmpi']['torque_dir']` - If Torque is supported, this needs to be set as well. Default is `/opt/torque`.

Usage
-----
#### openmpi::default

Just include `openmpi` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openmpi]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Koji Tanaka (<kj.tanaka@gmail.com>)

```text
Copyright 2014, FutureGrid, Indiana Univercity

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
