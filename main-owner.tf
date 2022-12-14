module "network" {
  source                 = "./modules/network"
  public_subnets_per_vpc = var.public_subnets_per_vpc
  enviroment             = var.enviroment
}

module "security" {
  source = "./modules/security"
  depends_on = [module.network]
  vpcid      = module.network.vpcid
  enviroment = var.enviroment
  vpcname    = module.network.vpcname
}

module "eks" {
  source                                     = "./modules/eks"
  depends_on = [module.network, module.security]
  subnet                                     = module.network.subnet
  enviroment                                 = var.enviroment
  role_arn                                   = module.security.role_arn
  blogapp-AmazonEKSClusterPolicy             = module.security.blogapp-AmazonEKSClusterPolicy
  nodes_arn                                  = module.security.nodes_arn
  blogapp-AmazonEKSWorkerNodePolicy          = module.security.blogapp-AmazonEKSWorkerNodePolicy
  blogapp-AmazonEKS_CNI_Policy               = module.security.blogapp-AmazonEKS_CNI_Policy
  blogapp-AmazonEC2ContainerRegistryReadOnly = module.security.blogapp-AmazonEC2ContainerRegistryReadOnly
  blogapp-AmazonEKSVPCResourceController     = module.security.blogapp-AmazonEKSVPCResourceController
  instance_type                              = var.instance_type
}

/* module "helm" {
  depends_on = [module.eks, module.security]
  source = "./modules/helm"
} */


/* 
module "compute" {
  source = "./modules/compute"
  security_groups = module.security.security_groups
  subnet = module.network.subnet
  enviroment = var.enviroment
  instances_per_subnet = var.instances_per_subnet
  ami           = var.ami
}

module "load_balancing" {
  count = length(module.network.subnet) > 1 ? 1:0
  source = "./modules/load_balancing"
  vpcid = module.network.vpcid
  vpcname = module.network.vpcname
  instances_ids = module.compute.instance_id
  security_groups = module.security.security_groups
  subnet = module.network.subnet
}
*/