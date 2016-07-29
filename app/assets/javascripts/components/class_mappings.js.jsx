// var ClassMappings = React.createClass({
//     getInitialState() {
//         return {
//             class_mappings: this.props.class_mappings,
//             class_mapping: {
//                 standard: '',
//                 section: '',
//                 school: ''
//             }
//         }
//     },
//
//     render: function() {
//         var that = this;
//         class_mappings = this.state.class_mappings.map( function(class_mapping) {
//             return (
//                 <ClassMappings class_mapping={class_mapping} key={class_mapping.id} onRemoveClassMapping = {that.handleClassRemove}  />
//             );
//         });
//         return (
//             <div>
//                 <h1>Listing Class Mappings</h1>
//                 <div id="class_mappings">
//                     <table>
//                         <thead>
//                         <tr>
//                             <th>Standard Name</th>
//                             <th>Section Name</th>
//                             <th>School Name</th>
//                         </tr>
//                         </thead>
//                         <tbody>
//                         {class_mappings}
//                         </tbody>
//                     </table>
//                     <input type="text" placeholder="Enter standard" onChange={this.handleStandardChange} /><br />
//                     <input type="text" placeholder="Enter section" onChange={this.handleSectionChange} /><br />
//                     <button class="waves-effect waves-light btn" onClick={this.addNewClass}>New Class</button>
//                 </div>
//             </div>
//         );
//     },
//
//     handleStandardChange(e) {
//         var newClass = this.state.class_mapping;
//         newClass.standard = e.target.value;
//         this.setState({class_mapping: newClass});
//     },
//
//     handleSectionChange(e) {
//         var newClass = this.state.class_mapping;
//         newClass.section = e.target.value;
//         this.setState({class_mapping: newClass});
//     },
//
//
//     addNewClass() {
//         var that = this;
//         $.ajax({
//             method: 'POST',
//             data: {
//                 class_mapping: that.state.class_mapping,
//             },
//             url: 'class_mappings/',
//             success: function(res) {
//                 var newClassList = that.state.class_mappings;
//                 newClassList.push(res);
//                 that.setState({
//                     class_mappings: newClassList,
//                     class_mapping: {
//                         standard: '',
//                         section: '',
//                         school: ''
//                     }
//                 });
//             }
//         });
//     },
//
//     handleClassRemove(class_mapping) {
//         var classList = this.state.class_mappings.filter(function(item) {
//             return class_mapping.id !== item.id;
//         });
//         this.setState({
//             class_mappings: classList
//         });
//     }
//
// });


var ClassMappings = React.createClass({

    getInitialState() {
        return {
            class_mappings: this.props.class_mappings,
            class_mapping: {
                standard: '',
                section: '',
                school: ''
            }
        }
    },

    render: function() {
        class_mappings = this.state.class_mappings.map( function(class_mapping) {
            return <ClassMapping class_mapping={class_mapping} key={class_mapping.id} />
        });
        return (
            <div>
                <h1>ClassMappings</h1>
                <div id="class_mappings">
                    <table>
                        <thead>
                        <tr>
                            <th>Standard</th>
                            <th>Section</th>
                        </tr>
                        </thead>
                        <tbody>
                        {class_mappings}
                        </tbody>
                    </table>
                    <input type="text" placeholder="Enter standard" onChange={this.handleStandardChange} /><br />
                    <input type="text" placeholder="Enter section" onChange={this.handleSectionChange} /><br />
                    <button class="waves-effect waves-light btn" onClick={this.addNewClass}>New Class</button>
                </div>
            </div>
        );
    },



    handleStandardChange(e) {
        var newClass = this.state.class_mapping;
        newClass.standard = e.target.value;
        this.setState({class_mapping: newClass});
    },

    handleSectionChange(e) {
        var newClass = this.state.class_mapping;
        newClass.section = e.target.value;
        this.setState({class_mapping: newClass});
    },


    addNewClass() {
        var that = this;
        $.ajax({
            method: 'POST',
            data: {
                class_mapping: that.state.class_mapping,
            },
            url: 'class_mappings/',
            success: function(res) {
                var newClassList = that.state.class_mappings;
                newClassList.push(res);
                that.setState({
                    class_mappings: newClassList,
                    class_mapping: {
                        standard: '',
                        section: '',
                        school: ''
                    }
                });
            }
        });
    },

    handleClassRemove(class_mapping) {
        var classList = this.state.class_mappings.filter(function(item) {
            return class_mapping.id !== item.id;
        });
        this.setState({
            class_mappings: classList
        });
    }
});
