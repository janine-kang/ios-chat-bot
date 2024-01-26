# 챗봇 앱
---

### Table of Content

> ** 1️⃣ OverView**
>
> - 결과물
> - 프로젝트 참여자
> - 프로젝트 기간
>
> ** 2️⃣ 프로젝트 구현**
>
> - 프로젝트 설계
> - 사용 기술/구성
> - 태스크 매니지먼트
> - 프로젝트 파일 구조
> - 구현 기능
> - 구현 상세
>
> ** 3️⃣ 습득 지식**
>
> - Trouble Shooting
> - Keywords

## 1️⃣ OverView

### 📍 결과물

### 📍 프로젝트 참여자

<table>
<tr>
<th>🥭 Mango</th>
<th>🐠 Janine</th>
</tr>
<tr>
<td>
<img src="https://avatars.githubusercontent.com/u/97822621?v=4" width="90" height="90">
<div>@ehdwns0814</div>
</td>
<td>
<img src="https://avatars.githubusercontent.com/u/76927263?v=4" width="90" height="90"> 
<div>@janine-kang</div>
</td>
</tr>
</table>

### 📍 프로젝트 기간

> 2024.01.02 ~ 2024.01.26 (4 weeks)

## 2️⃣ 프로젝트 구현

### 📍 프로젝트 설계

- 디자인 패턴: `MVVM`

### 📍 사용 기술/구성

- Swift 기반 어플리케이션 작성
- UIKit framework
- Code Base UI
- Combine

### 📍 태스크 매니지먼트

- Notion
- Discord

### 📍 프로젝트 파일 구조

```

ChatBot
├── Base.lproj
├── Controllers
│   └── ChatViewController.swift
├── Environment.xcconfig
├── Errors
│   └── APIError.swift
├── Feature
│   ├── Enums
│   │   ├── ChatType.swift
│   │   └── Constants.swift
│   └── PostChatBotNetworkBuilder.swift
├── Info.plist
├── Models
│   ├── ChatMessage.swift
│   ├── ChatRequest.swift
│   └── ChatResponse.swift
├── Module
│   └── Extensions
│       ├── Array.swift
│       ├── String.swift
│       ├── UIStackView.swift
│       ├── UIView.swift
│       └── URLSession.swift
├── Network
│   ├── APIService.swift
│   ├── Enums
│   │   ├── Endpoint.swift
│   │   ├── Environment.swift
│   │   └── HttpMethod.swift
│   ├── Environment.swift
│   └── NetworkRequestBuildable.swift
├── Resources
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   └── SceneDelegate.swift
├── ViewModels
│   └── ChatViewModel.swift
└── Views
    ├── BubbleCircle.swift
    ├── Cells
    │   ├── ChatLoadingBubbleCell.swift
    │   └── ChatMessageCell.swift
    ├── ChatBubbleTail.swift
    ├── ChatMessageCell.swift
    └── LoadingBubble.swift
```


### 📍 구현 기능

#### 메인 화면
<table>
<tr>
<th>구동 화면</th>
<th>구현 기능</th>
</tr>
<tr>
<td>
<img width="280" height="auto" alt="Screenshot1" src="https://github.com/ehdwns0814/ios-chat-bot/assets/97822621/6c14e571-4a5a-45f6-a2da-686afdf9c667">
</td>
<td>
  <li>채팅방 화면 구현</li>
  <li>채팅을 통해 AI 답변 받아오기 기능</li>
    <li>대화 컨텍스트 캐싱 기능</li>
    <li>말풍선 길이에 따라 화면 하부로 이동 기능</li>
</td>
</tr>
</table>



### 📍 구현 상세

- CollectionView와 UICollectionViewCell 재사용을 활용하여 UI 표기
- UICollectionViewFlowLayout 이용하여 레이아웃 설정
- Core Graphics 사용하여 말풍선 디자인
- Core Animation을 사용하여 메시지 로딩 중 구현
- Combine과 MVVM 패턴 사용
- Event에 대응하는 데이터 바인딩
- URLSession의 dataTaskPublisher 이용하여 데이터 통신
- API Key 은닉화 위해 .xcuserdata 파일 사용


## 3️⃣ 습득 지식

### Trouble Shooting
- 초기에 VM: V의 관계를 1:1의 관계로 정의하고 데이터 바인딩을 Multi Event trigger-UI Rendering Timing 중심으로 설정
- 이후 1:N의 가능성을 확인하고 단일 Event trigger-UI Rendering Timing으로 설정 변경

<table>
<tr>
<th>🥭 Mango</th>
<th>🐠 Janine</th>
</tr>
<tr>
<td>
<li>Combine</li>
<li>CollectionView와 FlowLayout</li>
<li>Core Graphics</li>
<li>Core Data</li>

</td>
<td>
<li>Combine</li>
<li>MVVM</li>
<li>Core Graphics와 Core Animation</li>
</td>
</tr>
</table>
