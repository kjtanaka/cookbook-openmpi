default['openmpi']['version'] = "1.8.1"
major, minor, tiny = node['openmpi']['version'].split('.')
default['openmpi']['download_url'] = "http://www.open-mpi.org/software/ompi/v#{major}.#{minor}/downloads/openmpi-#{node['openmpi']['version']}.tar.bz2"
default['openmpi']['download_dir'] = "/root/source"
default['openmpi']['install_dir'] = "/opt"

# Optional: Torque
default['openmpi']['support_torque'] = false
default['openmpi']['torque_dir'] = "/opt/torque"
