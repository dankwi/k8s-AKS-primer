# what is turned on
kubectl api-resources |grep true

# names of namespaces

kubectl get ns



# exporting objects from k8s  cluster

# for a single namespace in single yaml file 
kubectl get deploy,sts,svc,configmap,secret -n default -o yaml --export > default.yaml


# for a single namespace in multiple yaml files 

for n in $(kubectl get -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,statefulset,hpa,job,cronjob)
do
    mkdir -p $(dirname $n)
    kubectl get -o=yaml --export $n > $n.yaml
done