const { S3 } = require('aws-sdk');
const bootstrap = async () => {
  const s3Client = new S3({
    apiVersion: '2006-03-01',
    accessKeyId: 'accessKey1',
    secretAccessKey: 'verySecretKey1',
    endpoint: 'http://localhost:5000',
    s3BucketEndpoint: false,
    s3ForcePathStyle: true,
  });
  const listBucketsResponse = await s3Client.listBuckets().promise()
  if (listBucketsResponse.Buckets.length === 0) {
    await s3Client.createBucket({ Bucket: 'images', ACL: 'public-read' }).promise();
  }
  console.log(await s3Client.listBuckets().promise());
};
bootstrap();