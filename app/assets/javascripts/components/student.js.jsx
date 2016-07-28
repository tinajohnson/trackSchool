var Student = React.createClass({
    getInitialState() {
        return {
            student: this.props.student,
            class_mapping: this.props.classes
        }
    },

    render() {
        return (
            <tr>
                <td>{this.state.student.name}</td>
                <td>{this.state.student.class_mapping.id}</td>
            </tr>
        );
    }
});