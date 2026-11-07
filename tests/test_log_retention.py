   import pytest
   from botocore.exceptions import ClientError


   def test_oms_log_cannot_be_deleted(s3, sample_log_key):
       with pytest.raises(ClientError) as err:
           s3.delete_object(Bucket="regmind-oms-logs", Key=sample_log_key)
       assert "AccessDenied" in str(err.value)
