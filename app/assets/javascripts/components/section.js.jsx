var Section = React.createClass({
    getInitialState() {
        return {
            section: this.props.section,
            editMode: false
        }
    },

    render() {
        if ( this.state.editMode ) {
            markup = (
                <tr>
                    <td>
                        <input
                            type="text"
                            value={this.state.section.name}
                            onChange={this.handleNameChange} />
                    </td>
                    <td>
                        <button onClick={this.handleSectionUpdate}>Save</button>
                    </td>
                </tr>
            );
        } else {
            markup = (
                <tr>
                    <td>{this.state.section.name}</td>
                    <td>
                        <button onClick={this.setEditMode}>Edit</button>
                    </td>
                    <td>
                        <button onClick={this.removeSection}>Destroy</button>
                    </td>
                </tr>
            );
        }
        return markup;
    },

    setEditMode() {
        this.setState({editMode: true});
    },

    handleNameChange(e) {
        var newSection = this.state.section;
        newSection.name = e.target.value;
        this.setState({section: newSection});
    },

    handleSectionUpdate() {
        var that = this;
        $.ajax({
            method: 'PUT',
            data: {
                section: that.state.section,
            },
            url: '/sections/' + that.state.section.id,
            success: function(res) {
                that.setState({
                    section: res,
                    editMode: false
                });
            }
        });
    },

    removeSection() {
        var that = this;
        $.ajax({
            method: 'DELETE',
            url: '/sections/'+that.state.section.id,
            success: function(res) {
                that.props.onRemoveSection(that.state.section);
            }
        })
    },
});