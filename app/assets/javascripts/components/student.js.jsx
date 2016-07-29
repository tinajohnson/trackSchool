var Student = React.createClass({
    getInitialState() {
        return {
            student: this.props.student,
        }
    },

    render() {
        return (
            <tr>
                <td>{this.state.student.name}</td>
                <td>{this.state.student.standard}</td>
                <td>{this.state.student.section}</td>
                <td>
                    <button onClick={this.removeStudent}>Destroy</button>
                </td>
            </tr>
        );
    },

    removeStudent() {
        var that = this;
        $.ajax({
            method: 'DELETE',
            url: '/students/'+that.state.student.id,
            success: function(res) {
                that.props.onRemoveStudent(that.state.student);
            }
        })
    }
});