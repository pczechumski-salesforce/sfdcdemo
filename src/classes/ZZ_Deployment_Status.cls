public without sharing class ZZ_Deployment_Status {
	public ZZ_Deployment_Status() {

	}

	public List <DeploymentWrap> liDeployments {
		get{
			if (liDeployments == null){
				liDeployments = new List <DeploymentWrap>();

				for (ZZ_Enviroment__c env : [select (select Release__r.name, Release__r.description__c,
						Release__c, Status__c, Deployed_Date__c from Enviroment_Releases__r order by name desc), Name, Order__c
					from ZZ_Enviroment__c
					order by Order__c]){
					if (env.Enviroment_Releases__r.size() == 0){
						liDeployments.add(new DeploymentWrap(env.name, null, null, null, null));
					}
					else{
						for (ZZ_Enviroment_Release__c er : env.Enviroment_Releases__r){
							liDeployments.add(new DeploymentWrap(env.name, er.Release__r.name, er.Release__r.description__c, er.Status__c, er.Deployed_Date__c));
						}
					}
				}
			}
			return liDeployments;
		}
		set;
	}

	public List <DeploymentWrap> liCurrentDeployment {
		get{
			if (liCurrentDeployment == null){
				liCurrentDeployment = new List <DeploymentWrap>();

				for (ZZ_Enviroment__c env : [select (select Release__r.name, Release__r.description__c,
						Release__c, Status__c,Deployed_Date__c  from Enviroment_Releases__r order by name desc), Name, Order__c
					from ZZ_Enviroment__c
					order by Order__c]){
					if (env.Enviroment_Releases__r.size() == 0){
						liCurrentDeployment.add(new DeploymentWrap(env.name, null, null, null, null));
					}
					else{
						ZZ_Enviroment_Release__c er = env.Enviroment_Releases__r[0];
						liCurrentDeployment.add(new DeploymentWrap(env.name, er.Release__r.name, er.Release__r.description__c, er.Status__c, er.Deployed_Date__c));
					}
				}
			}
			return liCurrentDeployment;
		}
		set;
	}

	public class DeploymentWrap{
		public String enviromentName {get;set;}
		public String deploymentName {get;set;}
		public String deploymentDesc {get;set;}
		public String status {get;set;}
		public Date deployDate {get;set;}

		public DeploymentWrap(){}
		public DeploymentWrap (String env, String deploy, String description, String deploymentStatus, Date dDate){
			this.enviromentName = env;
			this.deploymentName = deploy;
			this.deploymentDesc = description;
			this.status = deploymentStatus;
			this.deployDate = dDate;
		}
	}
}