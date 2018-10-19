# SafeKit cluster (mirror application module)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fd6p%2Fazure-quickstart-templates%2Fsafekit-cluster-mirror%2Fsafekit-cluster-mirror%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Description
This template deploys 2 vms (windows or linux) with SafeKit (see <a href="https://www.evidian.com/safekit">this page</a> for more information) installed and configured to include all the VMS in a cluster.
Each VM has a public IP address.

+ a public VIP associated with a public loadbalancer is deployed.
+ A mirror application module (name: "mirror") is deployed and configured. 
+ The public loadbalancer is configured with:
  +	the public VIP as frontend IP
  +	All the VMs in its backend pool.
  + A health probe to check the mirror module state
  + A loadbalancing rule for external port 9453, internal port 9453 to access the test url ('mosaic')

## How to use
After deployment, go to the output panel and
+ visit the credential url to get the client and CA certificates 
+ After certificates installation, use the "start" button to connect to the web console of the cluster.

Beware, work in progress ... :umbrella: :umbrella:


