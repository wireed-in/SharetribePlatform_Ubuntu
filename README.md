SharetribePlatform_Ubuntu
==========================
This repository contains the source for an Elastic Beanstalk Custom Platform for Sharetribe.
This custom platform is based on **Ubuntu 16.04** and supports **Ruby on Rails**.

See the Packer template, *custom_platform.json*, for details on the AMI and
scripts that the builder runs as it creates the custom platform.

Once Packer has built the custom platform, it is available in the Console,
EB CLI, and APIs/SDKs as "Sharetribe Development Environment".

For further information on custom platforms, see the
[Custom Platforms docs](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/custom-platforms.html).

