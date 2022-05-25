import { LightningElement ,api, wire, track} from 'lwc';
import { reduceErrors } from 'c/ldsUtils';
import getAccountList from '@salesforce/apex/AccountHelper.getAccountList';
export default class myTable extends LightningElement {

  @track columnCont = [{
        label: 'Account name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
      },
      {
        label: 'Industry',
        fieldName: 'Industry',
        type: 'Picklist',
        sortable: true
      },
      {
        label: 'Contact Count',
        fieldName: 'Contact_Count__c',
        type: 'Number',
        sortable: true
      }
  ];

  @track columnOpp = [{
    label: 'Account name',
    fieldName: 'Name',
    type: 'text',
    sortable: true
  },
  {
      label: 'Industry',
      fieldName: 'Industry',
      type: 'Picklist',
      sortable: true
  },
  {
      label: 'Opportunity Count',
      fieldName: 'Opportunity_Count__c',
      type: 'Number',
      sortable: true
  }
];
 
  @track error;
  @track accList ;
  @wire(getAccountList)
  wiredAccounts({
    error,
    data
  }) {
      if (data) {
        this.accList = data;
      } else if (error) {
        this.error = error;
      }
  }

  get errors() {
    return (this.accounts.error) ?
        reduceErrors(this.accounts.error) : [];
}
}