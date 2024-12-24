# Project Name

The project uses the GitHub API to display a list of users that can be downloaded, and allows users to view detailed information.
# Preview
<img src="https://github.com/user-attachments/assets/26b65862-fcc6-4b35-afc7-2cfaa6bdaf6f" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/4c8a3ad3-453d-44f5-8340-b481a3bb1817" width="300" height="600" />





## 1. Libraries Used

- **Kingfisher**: Used for downloading and caching images asynchronously.
- **SwiftyJSON**: Simplifies parsing JSON data into native Swift objects.
- **SVProgressHUD**: Displays progress indicators (HUDs) during network operations.

## 2. App Features

- **User Information List**: Displays a list of users fetched from a remote API or local database.
- **Image Caching**: Uses Kingfisher to download and cache user profile images.
- **JSON Parsing**: Uses SwiftyJSON for easy handling of JSON data.
- **Loading Indicator**: Uses SVProgressHUD to show and hide progress indicators during network requests.
- **Local Database**: When there are no users, the app will fetch data from the API to display. On subsequent loads, it will load the data from Core Data.

## 3. Technology
- **Async Let**: To fetch multiple users concurrently using async let
- **Async await**: modern concurrency
- **XCTestCase**
- **UIKit**
- **Core Data**

## 4. Architecture
<img width="782" alt="image" src="https://github.com/user-attachments/assets/5d65b177-eff2-4215-99d6-e23c4db47cf5" />

[Our architecture is based on the VIP architecture](https://clean-swift.com/)

1. **View**: 
   - **Role**: The **View** is responsible for displaying the UI elements and handling user interaction (e.g., tapping buttons, scrolling lists).
   - **Responsibilities**:
     - Display data passed from the **Interactor**.
     - Show loading or error states as indicated by the **Interactor**.
   - **Example in the project**: The `ListUserInformationViewController` displays the list of users, shows loading indicators, and allows navigation to a detailed user view.

2. **Interactor**:
   - **Role**: The **Interactor** contains the business logic and is responsible for fetching and processing data. It interacts with **Worker** to fetch Data or save Data to the local disk.
   - **Responsibilities**:
     - Retrieve user data from **Worker**.
     - Handle data when the **If there is no data, it loads data from the GitHub API; otherwise, it loads local data from Core Data.**
     - Perform data manipulation and validation if needed.
     - Pass data or handle error to the **Viewcontorller** for display.
   - **Example in the project**: The `ListUserInformationInteractor` is responsible for fetching the user data either from the GitHub API or local storage, and sending it to the **Viewcontroller**.

3. **Worker**:
   - **Role**: The **Worker** A worker interacts with the API or database to perform tasks such as retrieving data from the database or fetching data locally.
   - **Responsibilities**:
     - Receive data from the **API or DataBase**.
   - **Example in the project**: The `ListUserInformationWorker` get data from github API or get data from CoreData.

4. **Router**:
   - **Role**: The **Worker** Responsible for managing the navigation logic of the app.
   - **Responsibilities**:
     - Navigation to destination viewcontroller.
   - **Example in the project**: The `ListUserInformationRouter` is responsible to navigate to `DetailsViewcontroller`.
  
   
5. **Viewcontroller**:
   - **Role**: The **Viewcontroller** Responsible for managing logic view and get data from interactor.
   - **Responsibilities**:
     - get the user interaction from view and forward the interactor.
   - **Example in the project**: The `ListUserInformationViewcontroller` handle logic show error and and configure data to display view.


## 5. Setup and Installation

1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/hiepcute/takehomeproject.git

## Testing Status
Due to the extensive number of unit tests, we haven't had time to implement additional tests and UI tests yet.

