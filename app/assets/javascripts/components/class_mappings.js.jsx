var ClassMappings = React.createClass({

    getInitialState() {
        return {
            class_mappings: this.props.class_mappings,
            class_mapping: {
                standard: '',
                section: '',
            },
            standards: this.props.standards,
            sections: this.props.sections
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
                    <h6>Select Standard: </h6>
                    <select className="browser-default" onChange={this.handleStandardChange}>
                        <option value="">Select</option>
                        {
                            this.props.standards.map(function(option) {
                                return <option key={option.id}
                                               value={option.name}>{option.name}</option>;
                            })
                        }
                    </select><br />
                    <h6>Select Section: </h6>
                    <select className="browser-default" onChange={this.handleSectionChange}>
                        <option value="">Select</option>
                        {
                            this.props.sections.map(function(option) {
                                return <option key={option.id}
                                               value={option.name}>{option.name}</option>;
                            })
                        }
                    </select>
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
