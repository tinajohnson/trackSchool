var ClassMapping = React.createClass({
    getInitialState() {
        return {
            class_mapping: this.props.class_mapping
        }
    },

    render() {
        return(
            <tr>
                <td>{this.state.class_mapping.standard}</td>
                <td>{this.state.class_mapping.section}</td>
                <td>
                    <button onClick={this.removeClassMapping}>Destroy</button>
                </td>

            </tr>  
        );
    },
    
    removeClassMapping() {
        var that = this;
        $.ajax({
            method: 'DELETE',
            url: '/class_mappings/'+that.state.class_mapping.id,
            success: function(res) {
                that.props.onRemoveClassMapping(that.state.class_mapping);
            }
        })
    }
});