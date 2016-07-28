var Sections = React.createClass({
    getInitialState() {
        return {
            sections: this.props.sections,
            section: {
                name:''
            }
        }
    },

    render: function() {
        var that = this;
        sections = this.props.sections.map( function(section) {
            return (
                /*onRemoveSection = {that.handleSectionRemove}*/
                <Section section={section} key={section.id} onRemoveSection = {that.handleSectionRemove} />
            );
        });
        return (
            <div>
                <h1>Listing Sections</h1>
                <div id="sections">
                    <table>
                        <thead>
                        <tr>
                            <th>Section Name</th>
                        </tr>
                        </thead>
                        <tbody>
                        {sections}
                        </tbody>
                    </table>
                    <input type="text" placeholder="Enter new section" onChange={this.handleNameChange} /><br />
                    <button class="waves-effect waves-light btn" onClick={this.addNewSection}>New Section</button>
                </div>
            </div>
        );
    },

    handleNameChange(e) {
        var newSection = this.state.section;
        newSection.name = e.target.value;
        this.setState({section: newSection});
    },

    addNewSection() {
        var that = this;
        $.ajax({
            method: 'POST',
            data: {
                section: that.state.section,
            },
            url: 'sections/',
            success: function(res) {
                var newSectionList = that.state.sections;
                newSectionList.push(res);
                that.setState({
                    sections: newSectionList,
                    section: {
                        name: ''
                    },
                    errors: {}
                });
            }
        });
    },

    handleSectionRemove(section) {
        var sectionList = this.state.sections.filter(function(item) {
            return section.id !== item.id;
        });
        this.setState({sections: sectionList});
    }

});
