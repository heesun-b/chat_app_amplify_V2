# Amplify CLI

- 목차

- Amplify 명령줄 인터페이스(CLI)는 앱용 AWS 클라우드 서비스를 생성, 통합 및 관리하기 위한 통합 도구 체인이다.

## ✔️ 설치

---

```dart
// npm
npm install -g @aws-amplify/cli

// Mac or Linux
curl -sL https://aws-amplify.github.io/amplify-cli/install | bash && $SHELL

// Windows
curl -sL https://aws-amplify.github.io/amplify-cli/install-win -o install.cmd && install.cmd
```

☑️ **전제 조건**

- Node.js 및 NPM 설치
    - Node.js 버전 12.x 이상
        - `node -v`로 확인 가능
    - npm 버전 6.x 이상
        - `npm -v`로 확인 가능

### ✅ Amplify CLI 구성

---

- 로컬 시스템에서 Amplify CLI를 구성하려면 AWS 계정에 연결하도록 구성해야 한다.

☑️ **IAM 사용자 생성**

[Amazon Web Services Sign-In](https://signin.aws.amazon.com/signin?redirect_uri=https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1&state=hashArgs%23%2Fusers%2Fcreate&isauthcode=true&client_id=arn:aws:iam::015428540659:user/iamv2&forceMobileApp=0&code_challenge=SNiCzaqHbguIQA7LCQzmLrODiZmBP5hvUUz0kIHpkFo&code_challenge_method=SHA-256)

1. **사용자 이름 설정**
    
    ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled.png)
    

1. **정책 연결**
    - 정책 직접 연결 선택 후 권한 정책으로 `AdministratorAccess-Amplify`선택
        
        ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%201.png)
        

1. **사용자 생성**
    
    ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%202.png)
    

1. **엑세스 키 생성**
    - 사용자 목록 페이지
        
        ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%203.png)
        
    - 사용자 엑세스 키 생성
        
        ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%204.png)
        

1. **명령줄 인터페이스 선택**
    
    ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%205.png)
    

1. **access key 확인** 
    
    ![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%206.png)
    

1. **해당 CLI 프롬프트에 방금 복사한 값을 입력**
    
    ```dart
    Enter the access key of the newly created user:
    ? accessKeyId:  # YOUR_ACCESS_KEY_ID
    ? secretAccessKey:  # YOUR_SECRET_ACCESS_KEY
    This would update/create the AWS Profile in your local machine
    ? Profile Name:  # (default)
    
    Successfully set up the new user.
    ```
    

## ✔️ 프로젝트 초기화

---

```dart
amplify init
```

- 앱의 루트 디렉터리에서 명령 실행

```dart
Enter a name for the project #project_name
```

- 프로젝트 이름 설정

```dart
Initialize the project with the above configuration? 
```

- 프로젝트 기본값 설정 후, 해당 질문에 동의하면 프로젝트 초기화가 진행된다.

```dart
Select the authentication method you want to you? 
```

- Authentication 설정에 관한 질문에 원하는 값 선택
- 모든 단계를 거치면 프로젝트에 `amplify` 폴더와 `amplifyconfiguration.dart`파일이 생성된다.

☑️ **init 명령**

- 프로젝트 분석 및 프런트엔드 설정 확인
- 선택한 프런트엔드의 초기화 로직 수행
- 공급자 플러그인이 여러 개인 경우 클라우드 리소스에 대한 액세스를 제공할 플러그인을 선택하라는 메시지가 표시
- 선택한 플러그인의 초기화 로직을 순차적으로 수행
- 초기 프로젝트 구성을 사용하여 amplify 폴더 구조를 프로젝트의 루트 디렉터리에 삽입
- 위에서 선택한 플러그인의 출력으로 프로젝트 메타데이터 파일을 생성
- AWS Amplify Console 에서 클라우드 프로젝트를 생성하여 모든 백엔드 환경의 리소스를 보고 관리

## ✔️ Authentication

---

[](https://docs.amplify.aws/cli/auth/overview/)

### ✅ 소셜 제공자 X

```dart
amplify add auth  
```

- 만약 configured가 이미 존재한다면 `add` 대신 `update` 사용해야 한다.

```dart
Do you want to use the default authentication and security configuration?
❯ Default configuration
  Default configuration with Social Provider (Federation)
  Manual configuration
  I want to learn more.
```

### ✅ 소셜 제공자 O

- 사용자 풀이 작동하면 Facebook, Google과의 연동 또는 Amazon을 통한 로그인과 같은 추가 구성을 활성화할 수 있다.

```dart
amplify add auth 
```

- 만약 configured가 이미 존재한다면 `add` 대신 `update` 사용해야 한다.

```dart
Do you want to use the default authentication and security configuration?
  Default configuration
❯ Default configuration with Social Provider (Federation)
  Manual configuration
  I want to learn more.
```

### ✅ 사용자 그룹

- Cognito 사용자 풀에서 논리 그룹을 생성하고 CLI를 사용하여 Amplify 범주의 리소스에 액세스할 수 있는 권한을 할당할 수 있을 뿐만 아니라 한 그룹에서 다른 그룹에 대한 상대적 우선 순위를 정의할 수 있다.
- GraphQL의  @auth와 함께 사용 가능

☑️ **사용자 그룹 생성**

```dart
amplify add auth
```

```dart
❯ Manual configuration

Do you want to add User Pool Groups? (Use arrow keys)
❯ Yes

? Provide a name for your user pool group: Admins
? Do you want to add another User Pool Group Yes
? Provide a name for your user pool group: Editors
? Do you want to add another User Pool Group No
? Sort the user pool groups in order of preference …  (Use <shift>+<right/left> to change the order)
  Admins
  Editors
```

- 생성 완료 후 프로젝트의 `amplify/backend/auth/userPoolGroups/user-pool-group-precedence.json` 파일을 통해 수동으로 설정할 수도 있다.

☑️ **그룹 엑세스 제어**

- 특정 Amplify 범주의 경우 CRUD(생성, 읽기, 업데이트 및 삭제) 권한으로 액세스를 제한하여 인증된 사용자와 게스트에 대해 서로 다른 액세스 제어를 설정할 수 있다.
- 로그인한 사용자가 특정 사용자 풀 그룹의 일부인지 여부에 따라 조건부로 다른 권한을 적용하도록 이를 추가로 제한할 수도 있다.

```dart
amplify add storage  # Select content
```

```dart
? Restrict access by? (Use arrow keys)
  Auth/Guest Users
  Individual Groups
❯ Both
  Learn more

Who should have access?
❯ Auth and guest users

What kind of access do you want for Authenticated users?
❯ create/update, read

What kind of access do you want for Guest users?
❯ read

Select groups:
❯ Admins

What kind of access do you want for Admins users?
❯ create/update, read, delete
```

### ✅ 기존 Cognito User Pool 및 Identity Pool 사용

```dart
amplify import auth
```

- 선택한 Cognito 리소스 정보로 Amplify Library 구성 파일(aws-exports.js, amplifyconfiguration.json)을 자동으로 채운다.
- 모든 인증 종속 범주(API, 저장소 등)에 대한 인증 및 권한 부여 메커니즘으로 지정된 기존 Cognito 리소스를 제공한다.
- 허용하는 경우 Lambda 함수가 선택한 Cognito 리소스에 액세스하도록 활성화

```dart
amplify push
```

- 해당 명령어를 사용하여 완료

### ✅ 기존 Cognito User Pool 및 Identity Pool 연결 해제

```dart
amplify remove auth
```

- Amplify 프로젝트에서 참조되는 Cognito 리소스만 연결 해제되고, Cognito 리소스 자체는 삭제하지 않는다.

```dart
amplify push
```

- 해당 명령어로 절차 완료

## ✔️ API (GraphQL)

---

- GraphQL 스키마를 정의하기만 하면 Amplify CLI가 자동으로 스키마를 AWS AppSync, Amazon DynamoDB 등에서 제공하는 완벽하게 작동하는 GraphQL API로 변환한다.

### ✅ **GraphQL API 설정**

```dart
amplify add api
```

```dart
? Select from one of the below mentioned services:
> GraphQL

? Here is the GraphQL API that we will create. Select a setting to edit or continue
> Continue

? Choose a schema template:
> Single object with fields (e.g., “Todo” with ID, name, description)
...
Edit your schema at <...>/schema.graphql or place .graphql files in a directory at <...>/schema
✔ Do you want to edit the schema now? (Y/n)
> yes
Edit the file in your editor: <...>/schema.graphql
✅ Successfully added resource new locally
```

```dart
# This "input" configures a global authorization rule to enable public access to
# all models in this schema. Learn more about authorization rules here: https://docs.amplify.aws/cli/graphql/auth
input AMPLIFY { globalAuthRule: AuthRule = { allow: public } } # FOR TESTING ONLY!

type Todo @model {
  id: ID!
  name: String!
  description: String
}
```

- 기본 값을 수락하면 Todo 앱에 대한 GraphQL 스키마가 생성된다.
    - schema template 선택으로 정할 수 있다.

```dart
amplify push
```

- 해당 명령어를 통해 완료

### ✅ 데이터 모델링

- Amplify는 GraphQL Schema에 존재하는 GraphQL `type`에 `@model` 어노테이션이 존재하면 자동으로 Amazon DynamoDB 데이터베이스 테이블을 생성한다.
    - `@model` 어노테이션은 기본 키 id 또한 자동으로 생성해준다.
    - 도우미 필드 `createdAt`와 `updatedAt`유형도 추가해준다.
    - AWS AppSync가 사용자를 대신하여 위의 테이블을 호출할 수 있도록 DataSource에 연결된 AWS IAM 역할이다.
    - 최대 8개의 해결 프로그램(create, update, delete, get, list, onCreate, onUpdate, onDelete)이지만 `@model` 지시문의 쿼리, 변형 및 구독 인수를 통해 구성할 수 있다.
    - 목록 쿼리의 경우 반환되는 개체의 기본 수는 100개이다.
        - limit 인수를 설정하여 이 동작을 재정의할 수 있다.
- `@hasOne`, `@hasMany`, `@belongTo`, `@manyToMany`를 통해 테이블 간 관계를 생성할 수도 있다.

```dart
type Todo @model {
  content: String
}
```

![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%207.png)

☑️ **기본 키 구성**

- `@primaryKey` 어노테이션을 이용해 기본 키 구성을 변경할 수도 있다.
    - 단, 기본 키를 구성하고 배포한 후에는 데이터베이스 테이블을 삭제하고 다시 만들지 않고는 변경할 수 없다. ****

```dart
type Todo @model {
  todoId: ID! @primaryKey
  content: String
}
```

- 정렬키 (sort key) 설정 가능
    - 또한 지정된 `sortKeyFields`에 고급 정렬 및 필터링 조건을 적용할 수 있다.

```dart
type Inventory @model {
  productID: ID! @primaryKey(sortKeyFields: ["warehouseID"])
  warehouseID: ID!
  InventoryAmount: Int!
}
```

☑️ **보조 인덱스 구성**

- Amplify는 Amazon DynamoDB 테이블을 `@model` 유형의 기본 데이터 소스로 사용한다. 키-값 데이터베이스의 경우 "보조 인덱스"로 액세스 패턴을 모델링하는 것이 중요하다.

```dart
type Customer @model {
  id: ID!
  name: String!
  phoneNumber: String
  accountRepresentativeID: ID! @index
}
```

- 보조 인덱스 사용 시 쿼리에 활용 가능

```dart
 query QueryCustomersForAccountRepresentative($accountRepresentativeID: ID!) {
  customersByAccountRepresentativeID(accountRepresentativeID: $accountRepresentativeID) {
    customers {
      items {
        id
        name
        phoneNumber
      }
    }
  }
}
```

```dart
type Customer @model {
  id: ID!
  name: String!
  phoneNumber: String
  accountRepresentativeID: ID! @index(name: "byRepresentative", queryField: "customerByRepresentative")
}
```

- `name`또는 `queryField` 속성으로 보조 인덱스 이름과 쿼리 이름을 설정할 수 있다.

```dart
query QueryCustomersForAccountRepresentative($representativeId: ID!) {
  customerByRepresentative(accountRepresentativeID: $representativeId) {
    customers {
      items {
        id
        name
        phoneNumber
      }
    }
  }
}
```

- `name` 속성은 인덱스의 이름을 지정하는 데 사용된다.
- `queryField` 속성은 인덱스를 쿼리할 때 사용될 새로운 GraphQL 쿼리 필드의 이름을 지정하는 데 사용된다.

```dart
type Customer @model @auth(rules: [{ allow: public }]) {
  id: ID!
  name: String! @index(name: "byNameAndPhoneNumber", sortKeyFields: ["phoneNumber"], queryField: "customerByNameAndPhone")
  phoneNumber: String
  accountRepresentativeID: ID! @index
```

- 선택적으로 정렬 키를 구성하려면 `sortKeyFields` 를 설정하면 된다.

☑️ **테이블 간 관계 설정**

1. **hasOne**
- 경우 (1)
    - fields 속성을 사용하지 않을 시 기본 키(primary key)를 기준으로 연결된다.

```dart
type Project @model {
  id: ID!
  name: String
  team: Team @hasOne
}

type Team @model {
  id: ID!
  name: String!
}
```

```dart
mutation CreateProject {
  createProject(input: {projectTeamId: "team-id", name: "Some Name"}) {
    team {
      name
      id
    }
    name
    id
  }
}
```

```dart
import { createProject } from './graphql/mutations';

const params = {
    input: { projectTeamId: 'team-id', name: 'Some Name' },
};

const result = await API.graphql(graphqlOperation(createProject, params));
const project = result.data.createProject;
```

- 경우 (2) : `fields` 속성 사용

```dart
type Project @model {
  id: ID!
  name: String
  teamID: ID
  team: Team @hasOne(fields: ["teamID"])
}

type Team @model {
  id: ID!
  name: String!
}
```

1. **hasMany**
- 경우 (1)

```dart
type Post @model {
  id: ID!
  title: String!
  comments: [Comment] @hasMany
}

type Comment @model {
  id: ID!
  content: String!
}
```

```dart
mutation CreatePost {
  createPost(input: {title: "Hello World!!"}) {
    title
    id
    comments {
      items {
        id
        content
      }
    }
  }
}
```

- 경우 (2) : 보조 인덱스 사용

```dart
type Post @model {
  id: ID!
  title: String!
  comments: [Comment] @hasMany(indexName: "byPost", fields: ["id"])
}

type Comment @model {
  id: ID!
  postID: ID! @index(name: "byPost", sortKeyFields: ["content"])
  content: String!
}
```

```dart
mutation CreatePost {
  createPost(input: {title: "Hello world!"}) {
    comments {
      items {
        postID
        content
        id
      }
    }
    title
    id
  }
}
```

1. **belongsTo**
- with `@hasOne`

```dart
type Project @model {
  id: ID!
  name: String
  team: Team @hasOne
}

type Team @model {
  id: ID!
  name: String!
  project: Project @belongsTo
}
```

```dart
mutation CreateProject {
  createProject(input: { name: "New Project", teamID: "a-team-id"}) {
    id
    name
    team { # query team from project
      id
      name
      project { # bi-directional query: team to project
        id
        name
      }
    }
  }
}
```

- with `@hasMany`

```dart
type Post @model {
  id: ID!
  title: String!
  comments: [Comment] @hasMany
}

type Comment @model {
  id: ID!
  content: String!
  post: Post @belongsTo
}
```

```dart
mutation CreatePost {
  createPost(input: {title: "Hello World!!"}) {
    title
    id
    comments { # query comments from the post
      items {
        id
        content
        post { # bi-directional query: comment to post
          id
          title
        }
      }
    }
  }
}
```

- `fields` 속성을 이용한 예시
    - 만약 `fields` 속성 미사용 시 자동으로 `primary key`가 기준

```dart
type Post @model {
  id: ID!
  title: String!
  comments: [Comment] @hasMany(indexName: "byPost", fields: ["id"])
}

type Comment @model {
  id: ID!
  postID: ID! @index(name: "byPost", sortKeyFields: ["content"])
  content: String!
  post: Post @belongsTo(fields: ["postID"])
}
```

1. **manyToMany**

```dart
type Post @model {
  id: ID!
  title: String!
  content: String
  tags: [Tag] @manyToMany(relationName: "PostTags")
}

type Tag @model {
  id: ID!
  label: String!
  posts: [Post] @manyToMany(relationName: "PostTags")
}
```

- **`relationName`** 속성을 통해 결합

```dart
mutation CreatePost {
  createPost(input: {title: "Hello World!!"}) {
    id
    title
    content
    tags { # queries the "join table" PostTags
      items {
        tag { # related Tag records from Post
          id
          label
          posts { # queries the "join table" PostTags
            items {
              post { # related Post records from Tag
                id
                title
                content
              }
            }
          }
        }
      }
    }
  }
}
```

☑️ **필트 기본값 지정 (`@default`)** 

```dart
type Todo @model {
  content: String @default(value: "My new Todo")
}
```

- 위 예시에서 Todo 생성 시 content를 입력하지 않으면 `default` 어노테이션의 값이 자동으로 input 된다.

☑️ **subscription 서버 사이드 필터링**

```dart
type Task @model {
  title: String!
  description: String
  type: String
  priority: Int
}
```

```dart
**subscription** OnCreateTask {
  onCreateTask(
    filter: {
      and: [
        { type: { eq: "Security" } }
        { priority: { gt: 5 } }
      ]
    }
  ) {
    title
    description
    type
    priority
  }
}
```

```dart
import { onCreateTask } from './graphql/subscriptions';

const filter = {
    and: [
        { type: { eq: "Security" } }
        { priority: { gt: 5 } }
  ]
};

const subscription = API.graphql(graphqlOperation(onCreateTask, filter)).subscribe({
    next: ({ provider, value }) => console.log({ provider, value }),
    error: (error) => console.warn(error)
});
```

### ✅ Authentication Rules

- **`@auth`** 어노테이션 사용
- 권한 부여 규칙은 기본적으로 **거부 원칙**에 따라 작동한다.
- 권한 부여 규칙이 구체적으로 구성되지 않은 경우 거부됨을 의미한다.

```dart
type Todo @model @auth(rules: [{ allow: owner }]) {
  content: String
}

// owner 권한을 가진 user는 자신의 Todo를 create, read, update, delete 가능
```

- 허용되는 작업을 제한하고, 여러 인증 규칙을 결합하고, 세분화된 필드 수준 인증을 적용할 수 있다.

```dart
type Todo @model @auth(rules: [
  { allow: public, operations: [read]},
  { allow: owner }
]) {
  content: String
}

// 모든 user(public)은 읽기만 가능 
// owner는 모든 기능 가능
```

☑️ 권한 부여 전략

![Untitled](Amplify%20CLI%20e01650b0709e4be5b71f7d256e496014/Untitled%208.png)
