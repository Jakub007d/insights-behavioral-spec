Feature: Overview page behaviour on Advanced Cluster Management in case some or all issues are disabled in Insights Advisor


  Scenario: Displaying "Overview" page on ACM for one managed cluster in Ready state managed by AWS infrastruture for cluster with one disabled rule
    Given user USER1 is part of account (organization) ACCOUNT1
      And account (organization) ACCOUNT1 owns one managed cluster
      And the infrastructure for that managed cluster is provided by Amazon Web Services
      And that managed cluster should be in Ready state
      And 1 issue is detected for this cluster
      And this issue is disabled in Insights Advisor
      And the user USER1 is already logged in into Advanced Cluster Management
     When user looks at Advanced Cluster Management main page
     Then menu on the left side should be displayed
      And the left menu might contain these top level items
          | Left menu item      | Required for this test |
          | Home                | yes                    |
          | Infrastructure      | no                     |
          | Applications        | no                     |
          | Governance          | no                     |
          | Credential          | no                     |
          | Visual Web Terminal | no                     |
     When user expand "Home" top level item
     Then the menu should be expanded under "Home" top level item
      And following new items should be displayed in the sub-menu on the left side
          | Expanded menu item  | Required for this test |
          | Welcome             | no                     |
          | Overview            | yes                    |
     When user select "Overview" menu item from this sub-menu
     Then an "Overview" page should be displayed right of the left menu bar
      And several sections needs to be placed on the page
          | Section             | Required for this test |
          | AWS Amazon          | yes                    |
          | Summary             | yes                    |
          | Cluster compliance  | no                     |
          | Pods                | no                     |
          | Cluster status      | no                     |
          | Cluster issues      | yes                    |
      And "AWS Amazon" section should say "1 cluster"
      And "Cluster issues" section should contain information about no issues
