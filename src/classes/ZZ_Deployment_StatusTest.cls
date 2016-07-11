@isTest (seeAllData=false)
private class ZZ_Deployment_StatusTest {
	
	@isTest static void shouldNotReturnRecords() {
		ZZ_Deployment_Status ds = new ZZ_Deployment_Status();
        
        System.assertEquals(0, ds.liDeployments.size(), 'No records where created');
        
        System.assertEquals(0, ds.liCurrentDeployment.size(), 'No records where created');
	}
	
}