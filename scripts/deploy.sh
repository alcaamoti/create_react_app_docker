echo "###### Starting Deployment ######"
printenv
docker run $(printenv | grep -E '^AWS' | sed 's/AWS_/-e /g' | sed 's/-e /-e AWS_/g') alcaamoti/react-app