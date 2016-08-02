var Standard = React.createClass({
    getInitialState() {
        return {
            standard: this.props.standard,
            editMode: false
        }
    },

    setEditMode() {
        this.setState({editMode: true});
    },

    render() {
        if ( this.state.editMode ) {
            markup = (
                <tr>
                    <td>
                        <input
                            type="text"
                            value={this.state.standard.name}
                            onChange={this.handleNameChange} />
                    </td>
                    <td>
                        <button onClick={this.handleStandardUpdate}>Save</button>
                    </td>
                </tr>
            );
        } else {
            markup = (
                <tr>
                    <td>{this.state.standard.name}</td>
                    <td>
                        <button onClick={this.setEditMode}>Edit</button>
                    </td>
                    <td>
                        <button onClick={this.removeStandard}>Destroy</button>
                    </td>
                </tr>
            );
        }
        return markup;
    },

    handleNameChange(e) {
        var newStandard = this.state.standard;
        newStandard.name = e.target.value;
        this.setState({standard: newStandard});
    },

    handleStandardUpdate() {
        var that = this;
        $.ajax({
            method: 'PUT',
            data: {
                standard: that.state.standard,
            },
            url: '/standards/' + that.state.standard.id,
            success: function(res) {
                that.setState({
                    standard: res,
                    editMode: false
                });
            }
        });
    },

    removeStandard() {
        var that = this;
        $.ajax({
            method: 'DELETE',
            url: '/standards/'+that.state.standard.id,
            success: function(res) {
                that.props.onRemoveStandard(that.state.standard);
            }
        })
    },
});