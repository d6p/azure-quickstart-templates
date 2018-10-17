# Evidian SafeKit - High Availability Cluster with Synchronous Real-Time Replication and Failover in Azure - Mirror Module

[![](https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fd6p%2Fazure-quickstart-templates%2Fsafekit-cluster-mirror%2Fsafekit-cluster-mirror%2Fazuredeploy.json) 

*   [Architecture](#archi)
*   [Installation](#install)

## <a name="archi"></a>Architecture

![How the Evidian SafeKit mirror cluster implements real-time replication and failover in Azure?](https://www.evidian.com/safekit/images/azure-block-level-file-level-software-data-replication-mirror-cluster.png)

On the previous figure,

*   the critical application is running on the PRIM server
*   users are connected to a primary/secondary virtual IP address which is configured in the Azure load balancer
*   SafeKit brings a generic health probe for the load balancer. On the PRIM server, the health probe returns OK to the load balancer and NOK on the SECOND server.
*   in each server, SafeKit monitors the critical application with process checkers and custom checkers
*   SafeKit restarts automatically the critical application when there is a **software failure** or a **hardware failure** thanks to restart scripts
*   SafeKit makes synchronous real-time replication of files containing critical data
*   a connector for the SafeKit web console is installed in each server. Thus, the high availability cluster can be managed in a very simple way to avoid **human errors**

More information on **Evidian SafeKit**:

*   [Azure: The Simplest Load Balancing Cluster with Failover](https://www.evidian.com/products/high-availability-software-for-application-clustering/azure-load-balancing-cluster-failover/)
*   [Azure: The Simplest High Availability Cluster with Synchronous Replication and Failover](https://www.evidian.com/products/high-availability-software-for-application-clustering/azure-high-availability-cluster-synchronous-replication-failover/)

## <a name="install"></a>A single click to install the high availability cluster

To deploy the Evidian SafeKit high availability cluster with synchronous real-time replication and failover in Azure, just click on the following button which deploys everything:

[![](https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fd6p%2Fazure-quickstart-templates%2Fsafekit-cluster-mirror%2Fsafekit-cluster-mirror%2Fazuredeploy.json) 

### Configure the Azure template

After the click:

*   in "Resource group", click on "Create new" and set a name
*   choose the geographical "Location" where the cluster will be deployed
*   choose the "OS" Windows or Linux
*   choose an "Admin User" name (not Administrator)
*   choose an "Admin Password". Passwords must be between 12 and 72 characters and have 3 of the following: 1 lower case, 1 upper case, 1 number, and 1 special character.
*   click on "I agree..." and then on "Purchase" (no fee on SafeKit free trial, only on Azure infrastructure)
*   wait the end of deployment of the real-time replication and failover cluster

### After deployment

After deployment, go to the output panel and

*   visit the credential url to get the client and CA certificates in your web browser
*   after certificates installation, start the web console of the cluster
*   test the primary/secondary virtual IP address with the test URL in the output. A primary/secondary load balancing rule has been set for external port 9453, internal port 9453
