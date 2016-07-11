@isTest (seeAllData=false)
private class ZZ_Deployment_StatusTest {
	
	@isTest static void shouldNotReturnRecords() {
		ZZ_Deployment_Status ds = new ZZ_Deployment_Status();
        
        System.assertEquals(0, ds.liDeployments.size(), 'No records where created');        
        System.assertEquals(0, ds.liCurrentDeployment.size(), 'No records where created');
        
	}
	@isTest static void shouldReturn1Record() {
        // given
		ZZ_Deployment_Status ds = new ZZ_Deployment_Status();
        ZZ_Enviroment__c env = new ZZ_Enviroment__c (name='Unit Test', Order__c= 99);
        insert env;
        
        ZZ_Release__c rel = new ZZ_Release__c (name='Unit test 1');
        insert rel;
        
        ZZ_Enviroment_Release__c erel = new ZZ_Enviroment_Release__c();
        erel.Enviroment__c = env.id;
        erel.Release__c = rel.id;
        insert erel;
        
        //when
        //then
        System.assertEquals(1, ds.liDeployments.size(), '1 should be returned');        
        System.assertEquals(1, ds.liCurrentDeployment.size(), '1 should be returned');
        
       
	}
	
}