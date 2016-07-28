// var filterData = [
//     { name: 'Matthew', sex: 'male' },
//     { name: 'Amanda', sex: 'female' }
// ];
//
// //The form including the filter
// var FilterForm = React.createClass({
//     getInitialState: function() {
//         return {
//             data: this.props.data,
//             sex: ''
//         }
//     },
//
//     //setting filtered data
//     handleChange: function(val) {
//         this.setState({sex: val});
//         var filteredData = this.props.data.filter(function(item) {
//             return item.sex === val;
//         });
//         this.setState({data: filteredData});
//         console.log(filteredData, val);
//     },
//     render: function() {
//         return (
//             <div className="filter-form">
//                 <h1>Filter Form</h1>
//                 // filter
//                 <FilterOptions data={this.state.data} changeOption={this.handleChange} />
//                 // after filter
//                 <FilterItems data={this.state.data} />
//             </div>
//         );
//     }
// });
//
// //filter
// var FilterOptions = React.createClass({
//     getInitialState: function() {
//         return {
//             data: this.props.data,
//             sex: ''
//         }
//     },
//     handleChange: function(e) {
//         var val = e.target.value;
//         this.setState({sex: val});
//         this.props.changeOption(val);
//     },
//     render: function() {
//         return (
//             <select id="sex" value={this.state.sex} onChange={this.handleChange}>
//                 <option value=""></option>
//                 <option value="male">male</option>
//                 <option value="female">female</option>
//             </select>
//         );
//     }
// });
//
//
// //After filter is applied
// var FilterItems = React.createClass({
//     render: function() {
//         return (
//             <div className="filter-item">
//                 {this.props.data.map(function(item) {
//                     return (
//                         <div>{item.name}</div>
//                     );
//                 })}
//             </div>
//         );
//     }
// });
// React.render(
//     <FilterForm data={filterData} />,
//     document.getElementById('app')
// );