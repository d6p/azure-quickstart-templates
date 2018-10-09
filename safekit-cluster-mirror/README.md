# SafeKit cluster template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fd6p%2Fazure-quickstart-templates%2Fsafekit-cluster-template%2Fsafekit-cluster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Description
This template deploys up to 4 vms (windows / linux) with safekit installed and configured to include all the VMS in a cluster.
Each VM has a public IP address.
+ Optionally installs the azureRM powershell module on all VMs.
+ Optionally deploys a public VIP.
+ Optionally deploys a module. 
+ Optionally deploys an external loadbalancer with:
  +	the pubilc VIP as frontend IP
  +	All the VMs in its backend pool.
  + A health probe to check the optional module state
  + A loadbalancing rule for external port 443, internal port 9453 to access the test url ('mosaic')

## How to use
After deployment, go to the output panel and
+ visit the credential url to get the client and CA certificates 
+ After certificates installation, use the "start" button to connect to the console

Beware, work in progress ... :umbrella: :umbrella:


