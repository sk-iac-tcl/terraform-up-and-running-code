# 웹서버 클러스터 모듈 예제

이 폴더는 [Terraform](https://www.terraform.io/)의 [EC2](https://aws.amazon.com/ec2/), 자동 스케일링 그룹([Auto Scaling](https://aws.amazon.com/autoscaling/))과 로드밸런서([ELB](https://aws.amazon.com/elasticloadbalancing/))를 통해 웹서버 클러스터를 생성하는 실습 예제를 포함하고 있으며 로드밸런서를 통해 80포트로 오는 `/` URL 요청에 대해 "Hello, World"에 대한 응답을 수행 합니다. 자동 스케일링 그룹 설정을 통해서 무중단 배포가 가능 합니다.

자세한 내용은 *[테라폼 설치에서 운영까지](http://www.terraformupandrunning.com)* 서적의 "제5장, 테라폼 팁과 요령: 반복문, 조건문, 배포 및 주의사항"를 참고 하십시오.

## 시작 하기

모듈은 테라폼 구성 파일의 묶음이며 코드 전체의 여러 곳에서 재사용 가능하다. 
[live/stage/services/webserver-cluster](../../../live/stage/services-webserver-cluster)와
[live/prod/services/webserver-cluster](../../../live/prod/services-webserver-cluster)에서 이 공통된 모듈을 사용하는 예를 확인 할 수 있습니다.
