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

1. **View**: 
   - **Role**: The **View** is responsible for displaying the UI elements and handling user interaction (e.g., tapping buttons, scrolling lists).
   - **Responsibilities**:
     - Display data passed from the **Interactor**.
     - Show loading or error states as indicated by the **Interactor**.
   - **Example in the project**: The `ListUserInformationViewController` displays the list of users, shows loading indicators, and allows navigation to a detailed user view.

2. **Interactor**:
   - **Role**: The **Interactor** contains the business logic and is responsible for fetching and processing data. It interacts with external sources, such as APIs or local databases (e.g., Core Data).
   - **Responsibilities**:
     - Retrieve user data from the GitHub API or Core Data (if available).
     - Perform data manipulation and validation if needed.
     - Pass data to the **Viewcontorller** for display.
   - **Example in the project**: The `ListUserInformationInteractor` is responsible for fetching the user data either from the GitHub API or local storage, and sending it to the **Presenter**.

3. **Worker**:
   - **Role**: The **Presenter** acts as the intermediary between the **View** and the **Interactor**. It processes the data fetched by the **Interactor** and prepares it for display in the **View**.
   - **Responsibilities**:
     - Receive data from the **Interactor**.
     - Perform any data formatting or preparation needed.
     - Update the **View** with the processed data or error states.
   - **Example in the project**: The `ListUserInformationPresenter` processes the fetched user data and updates the view, handling success and error states.

4. **Worker**:
   - **Role**: The **Worker** is responsible for executing tasks like fetching data from an API, saving data to the database, or performing other background tasks. It is called by the **Interactor** and handles all the network requests or database-related tasks.
   - **Responsibilities**:
     - Fetch data from external sources like APIs.
     - Handle background tasks such as saving or deleting data from Core Data.
     - Perform any data manipulation needed before passing it back to the **Interactor**.
   - **Example in the project**: The `ListUserInformationWorker` is responsible for fetching user data from the GitHub API or loading it from Core Data. It handles the actual network request and the saving of data to local storage.

### Workflow
1. The **View** triggers user actions (e.g., tapping a button) and calls methods in the **Presenter**.
2. The **Presenter** calls methods in the **Interactor** to fetch data (either from API or local storage).
3. The **Interactor** delegates the fetching of data to the **Worker**.
4. The **Worker** performs the task (e.g., network request or database operation), and sends the data back to the **Interactor**.
5. The **Interactor** sends the data to the **Presenter**, which prepares it for display in the **View**.
6. The **View** updates its UI with the data or shows loading/error states.

## 4. Setup and Installation

1. Clone this repository to your local machine.
   ```bash
   git clone https://github.com/hiepcute/takehomeproject.git
