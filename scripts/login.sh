curl -X POST -c cookies.txt -s -w "%{http_code}" --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
  "auth": "admin",
  "password": "cangetin"
}' 'http://localhost:8081/api/auth/login'
echo ""
curl -X GET -s -c cookies.txt -b cookies.txt -w "%{http_code}" --header 'Accept: application/json' 'http://localhost:8081/api/project/1'
echo ""
curl -X GET -s -c cookies.txt -b cookies.txt -w "%{http_code}" --header 'Accept: application/json' 'http://localhost:8081/api/user'
curl -X GET -s -c cookies.txt -b cookies.txt -w "%{http_code}" --header 'Accept: application/json' 'http://localhost:8081/api/project/1/templates'
echo ""
curl -X POST -c cookies.txt -s -w "%{http_code}" --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
  "template_id": 6
  "debug": false,
  "dry_run": false,
  "playbook": "test_provision.yml"
  "environment": "openstack"
}' 'http://localhost:8081/api/project/1/tasks'
echo ""



