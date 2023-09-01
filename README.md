# todolist 🐣👶🍼
#### 개요: 해야할 일을 입력해서 추가하고 완료상태 및 완료된 목록을 표시하는 어플
#### 기간: 2023.08.25~2023.09.01(평일 6일(주말제외))

### 주요기능:
Navigation Controller 와 Segue 방식을 통한 화면전환
UserDefaults를 사용한 로컬 기기내 데이터베이스 사용
해야할 일을 work, life, shopping 세가지 카테고리로 나누어 리스트에 추가, 
해야할 일과 완료 목록의 항목에 대해서 타이틀 및 카테고리 수정, 삭제 기능


# 🔍 MVC Architecture Pattern
### M(Model)
#### - Task:
1) Task(struct) : id(Int), title(String), isCompleted(Bool), category(TaskCategory로 정의)
2) TaskCategory(enum) : work, life, shopping (String, CaseIterable, Codable)
#### - TaskList(struct)
1) 데이터 모델인 Task 구조체를 UserDefaults를 사용하여 배열로 저장하기 위한 JSONParsing 데이터 변환 메서드 
2) filter 기능을 사용하여 카테고리를 분류하고 완료된 항목을 구분할 수 있는 메서드
3) addTask, updateTask, completeTask,editTitle, editCategory, deleteTask 등 어플 운영에 필요한 전역 메서드들을 총체적으로 모아놓은 구조체
#### - V(View)
- TodoView : 앱의 메인 홈 화면 입니다. URLSession을 사용하여 URL정보를 불러와 이미지를 로드할 수 있고, To do(해야할 일)와 Done(완료목록) 2개의 버튼이 있습니다. 
- TodoListView : 해야할 일 목록을 표시하는 화면으로 UITableView와 TodoListTableViewCell을 가짐.
1) 사용자가 설정한 카테고리에 따라 섹션이 세가지로 나뉘어 항목이 표시됨
2) 항목 타이틀 우측의 스위치 토글을 클릭하여 활성(완료), 비활성(미완료) 상태로 변경이 가능하며 완료로 설정시 항목 타이틀에 취소선이 생기며 더욱 직관적으로 완료 인식 가능
3) 
- TodoCompleteView : TodoListView에서 사용자가 완료 설정시킨 항목을 모아서 표시하는 목록 화면. 
- TodoDetailView : TodoListView에서 항목 타이틀 클릭시 전환되는 화면으로 UILabel의 텍스트를 입력해 타이틀을 변경할 수 있고, 카테고리 역시 재선택을 통해 수정 가능하며 휴지통 모양의 아이콘을 클릭하여 입력된 정보를 삭제할 수 있다.
### C(Controller): 위 View들과 동일한 한 쌍으로 Controller 설정


# ☠️ Trouble Shooting
### JSONParsing(JSONEncoder/JSONDecoder 사용)
#### 결과:
구조체 형태의 데이터를 변환, 재구성 하는 방법과 그 일련의 과정의 이해에 대한 어려움, 프로젝트 기간중 상당 시간을 소모
#### 원인:
UserDefaults 사용으로 데이터를 이용함에 있어 API를 사용하지 않아 튜터님에게서 Parsing 사용을 비추천 받았으나 자신이 사용가능한 더 적절한 방법을 떠올리지 못해 구조체 데이터 변환 방법을 고수.
